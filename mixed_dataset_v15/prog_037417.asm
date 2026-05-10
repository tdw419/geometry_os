; DESCRIPTION: Creates a cyan filled rectangle of size 75x35 starting at (358, 134).
; PLAN: r0=358(x), r1=134(y), r2=75(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 134
LDI r2, 75
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
