; DESCRIPTION: Renders a white box of size 85x103 starting at (307, 128).
; PLAN: r0=307(x), r1=128(y), r2=85(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 128
LDI r2, 85
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
