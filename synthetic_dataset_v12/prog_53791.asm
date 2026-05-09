; DESCRIPTION: Places a cyan 20x71 rectangle at position (249, 165).
; PLAN: r0=249(x), r1=165(y), r2=20(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 165
LDI r2, 20
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
