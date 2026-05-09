; DESCRIPTION: Places a cyan 74x33 rectangle at position (209, 167).
; PLAN: r0=209(x), r1=167(y), r2=74(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 167
LDI r2, 74
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
