; DESCRIPTION: Draws a cyan line from (230, 213) to (120, 4).
; PLAN: r0=230(x1), r1=213(y1), r2=120(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 213
LDI r2, 120
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
