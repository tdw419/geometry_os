; DESCRIPTION: Places a cyan line segment connecting (180, 179) to (367, 215).
; PLAN: r0=180(x1), r1=179(y1), r2=367(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 179
LDI r2, 367
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
