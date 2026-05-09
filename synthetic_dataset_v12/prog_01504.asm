; DESCRIPTION: Renders a cyan box of size 61x111 starting at (175, 32).
; PLAN: r0=175(x), r1=32(y), r2=61(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 32
LDI r2, 61
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
