; DESCRIPTION: Places a yellow 71x34 rectangle at position (436, 173).
; PLAN: r0=436(x), r1=173(y), r2=71(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 173
LDI r2, 71
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
