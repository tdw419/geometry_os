; DESCRIPTION: Composite: Renders a black box of size 24x72 starting at (272, 150) then Draws a white line from (426, 47) to (243, 183).
; PLAN: r0=272(x), r1=150(y), r2=24(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x1), r6=47(y1), r7=243(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 150
LDI r2, 24
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 47
LDI r7, 243
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
