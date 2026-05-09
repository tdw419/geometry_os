; DESCRIPTION: Renders a white box of size 21x28 starting at (401, 139).
; PLAN: r0=401(x), r1=139(y), r2=21(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 139
LDI r2, 21
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
