; DESCRIPTION: Draws a cyan line from (364, 55) to (392, 125).
; PLAN: r0=364(x1), r1=55(y1), r2=392(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 55
LDI r2, 392
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
