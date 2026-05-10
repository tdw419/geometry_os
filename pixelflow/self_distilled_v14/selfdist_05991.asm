; DESCRIPTION: Creates a red filled rectangle of size 82x12 starting at (239, 177).
; PLAN: r0=239(x), r1=177(y), r2=82(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 177
LDI r2, 82
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
