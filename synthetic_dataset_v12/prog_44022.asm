; DESCRIPTION: Renders a magenta box of size 34x30 starting at (401, 86).
; PLAN: r0=401(x), r1=86(y), r2=34(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 86
LDI r2, 34
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
