; DESCRIPTION: Composite: . Then Places a red circle of radius 23 at center (39, 48). Then Draws a cyan line from (130, 154) to (57, 198).
; PLAN: r0=39(x), r1=48(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x1), r1=154(y1), r2=57(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 23 at center (39, 48).
; PLAN: r0=39(x), r1=48(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 48
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (130, 154) to (57, 198).
; PLAN: r0=130(x1), r1=154(y1), r2=57(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 57
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
