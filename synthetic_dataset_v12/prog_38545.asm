; DESCRIPTION: Renders a cyan box of size 16x71 starting at (342, 124).
; PLAN: r0=342(x), r1=124(y), r2=16(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 124
LDI r2, 16
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
