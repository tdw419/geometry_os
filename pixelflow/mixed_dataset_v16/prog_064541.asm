; DESCRIPTION: Places a cyan line segment connecting (213, 73) to (387, 20).
; PLAN: r0=213(x1), r1=73(y1), r2=387(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 73
LDI r2, 387
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
