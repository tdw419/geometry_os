; DESCRIPTION: Creates a red filled rectangle of size 113x95 starting at (296, 160).
; PLAN: r0=296(x), r1=160(y), r2=113(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 160
LDI r2, 113
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
