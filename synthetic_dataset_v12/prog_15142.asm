; DESCRIPTION: Places a cyan line segment connecting (295, 210) to (234, 132).
; PLAN: r0=295(x1), r1=210(y1), r2=234(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 210
LDI r2, 234
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
