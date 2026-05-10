; DESCRIPTION: Places a cyan line segment connecting (69, 239) to (252, 246).
; PLAN: r0=69(x1), r1=239(y1), r2=252(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 239
LDI r2, 252
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
