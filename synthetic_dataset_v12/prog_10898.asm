; DESCRIPTION: Renders a green box of size 61x64 starting at (159, 38).
; PLAN: r0=159(x), r1=38(y), r2=61(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 38
LDI r2, 61
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
