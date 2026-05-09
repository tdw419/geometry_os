; DESCRIPTION: Composite: Places a magenta 39x32 rectangle at position (428, 101) then Renders a cyan line between points (353, 242) and (10, 82).
; PLAN: r0=428(x), r1=101(y), r2=39(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=242(y1), r7=10(x2), r8=82(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 101
LDI r2, 39
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 242
LDI r7, 10
LDI r8, 82
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
