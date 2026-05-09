; DESCRIPTION: Places a cyan 96x28 rectangle at position (40, 112).
; PLAN: r0=40(x), r1=112(y), r2=96(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 112
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
