; DESCRIPTION: Draws a cyan line from (175, 133) to (320, 215).
; PLAN: r0=175(x1), r1=133(y1), r2=320(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 133
LDI r2, 320
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
