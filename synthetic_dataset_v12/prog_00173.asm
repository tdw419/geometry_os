; DESCRIPTION: Places a cyan 46x92 rectangle at position (436, 4).
; PLAN: r0=436(x), r1=4(y), r2=46(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 4
LDI r2, 46
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
