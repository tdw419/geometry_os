; DESCRIPTION: Renders a white box of size 21x42 starting at (204, 197).
; PLAN: r0=204(x), r1=197(y), r2=21(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 197
LDI r2, 21
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
