; DESCRIPTION: Renders a cyan box of size 105x120 starting at (228, 135).
; PLAN: r0=228(x), r1=135(y), r2=105(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 135
LDI r2, 105
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
