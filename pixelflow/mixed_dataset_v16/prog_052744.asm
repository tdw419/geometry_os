; DESCRIPTION: Places a cyan 69x92 box at position (48, 143).
; PLAN: r0=48(x), r1=143(y), r2=69(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 143
LDI r2, 69
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
