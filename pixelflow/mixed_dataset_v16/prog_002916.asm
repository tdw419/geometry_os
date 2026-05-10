; DESCRIPTION: Composite: Renders a green box of size 112x60 starting at (154, 89) then Places a red dot at position (280, 213) then Draws a cyan line from (243, 177) to (446, 33).
; PLAN: r0=154(x), r1=89(y), r2=112(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=213(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=243(x1), r11=177(y1), r12=446(x2), r13=33(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 89
LDI r2, 112
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 213
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 177
LDI r12, 446
LDI r13, 33
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
