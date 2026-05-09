; DESCRIPTION: Places a yellow 39x28 rectangle at position (289, 7).
; PLAN: r0=289(x), r1=7(y), r2=39(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 7
LDI r2, 39
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
