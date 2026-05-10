; DESCRIPTION: Places a cyan 69x92 rectangle at position (283, 83).
; PLAN: r0=283(x), r1=83(y), r2=69(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 83
LDI r2, 69
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
