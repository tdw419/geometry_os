; DESCRIPTION: Places a magenta line segment connecting (284, 168) to (413, 117).
; PLAN: r0=284(x1), r1=168(y1), r2=413(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 168
LDI r2, 413
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
