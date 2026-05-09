; DESCRIPTION: Draws a cyan line from (162, 163) to (346, 231).
; PLAN: r0=162(x1), r1=163(y1), r2=346(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 163
LDI r2, 346
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
