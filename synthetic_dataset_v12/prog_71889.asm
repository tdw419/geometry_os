; DESCRIPTION: Places a cyan line segment connecting (429, 161) to (32, 125).
; PLAN: r0=429(x1), r1=161(y1), r2=32(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 161
LDI r2, 32
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
