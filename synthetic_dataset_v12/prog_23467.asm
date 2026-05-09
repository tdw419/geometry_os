; DESCRIPTION: Places a yellow 21x25 rectangle at position (74, 173).
; PLAN: r0=74(x), r1=173(y), r2=21(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 173
LDI r2, 21
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
