; DESCRIPTION: Renders a cyan box of size 94x74 starting at (228, 76).
; PLAN: r0=228(x), r1=76(y), r2=94(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 76
LDI r2, 94
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
