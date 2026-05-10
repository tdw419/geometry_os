; DESCRIPTION: Creates a red filled rectangle of size 50x106 starting at (228, 38).
; PLAN: r0=228(x), r1=38(y), r2=50(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 38
LDI r2, 50
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
