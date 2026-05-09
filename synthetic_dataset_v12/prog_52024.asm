; DESCRIPTION: Places a cyan line segment connecting (239, 206) to (179, 126).
; PLAN: r0=239(x1), r1=206(y1), r2=179(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 206
LDI r2, 179
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
