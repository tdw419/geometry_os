; DESCRIPTION: Places a red line segment connecting (206, 228) to (5, 235).
; PLAN: r0=206(x1), r1=228(y1), r2=5(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 228
LDI r2, 5
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
