; DESCRIPTION: Places a red 85x91 box at position (34, 177).
; PLAN: r0=34(x), r1=177(y), r2=85(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 177
LDI r2, 85
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
