; DESCRIPTION: Places a cyan line segment connecting (67, 74) to (330, 113).
; PLAN: r0=67(x1), r1=74(y1), r2=330(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 74
LDI r2, 330
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
