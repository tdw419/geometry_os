; DESCRIPTION: Renders a cyan box of size 61x17 starting at (384, 10).
; PLAN: r0=384(x), r1=10(y), r2=61(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 10
LDI r2, 61
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
