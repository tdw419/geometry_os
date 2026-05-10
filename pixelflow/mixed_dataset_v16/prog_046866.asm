; DESCRIPTION: Renders a cyan box of size 114x77 starting at (228, 32).
; PLAN: r0=228(x), r1=32(y), r2=114(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 32
LDI r2, 114
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
