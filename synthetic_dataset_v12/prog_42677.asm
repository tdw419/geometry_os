; DESCRIPTION: Places a cyan 58x36 rectangle at position (347, 177).
; PLAN: r0=347(x), r1=177(y), r2=58(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 177
LDI r2, 58
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
