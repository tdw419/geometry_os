; DESCRIPTION: Creates a cyan filled rectangle of size 112x40 starting at (82, 60).
; PLAN: r0=82(x), r1=60(y), r2=112(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 60
LDI r2, 112
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
