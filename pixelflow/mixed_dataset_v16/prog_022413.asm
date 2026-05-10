; DESCRIPTION: Places a cyan 64x47 rectangle at position (51, 186).
; PLAN: r0=51(x), r1=186(y), r2=64(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 186
LDI r2, 64
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
