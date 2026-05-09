; DESCRIPTION: Draws a green line from (79, 231) to (173, 236).
; PLAN: r0=79(x1), r1=231(y1), r2=173(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 231
LDI r2, 173
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
