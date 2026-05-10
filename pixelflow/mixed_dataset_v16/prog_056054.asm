; DESCRIPTION: Composite: Places a red circle of radius 59 at center (115, 62) then Sets a single yellow pixel at (504, 42) then Draws a cyan line from (67, 92) to (168, 93).
; PLAN: r0=115(x), r1=62(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=42(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=67(x1), r11=92(y1), r12=168(x2), r13=93(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 62
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 42
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 67
LDI r11, 92
LDI r12, 168
LDI r13, 93
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
