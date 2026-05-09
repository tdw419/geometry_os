; DESCRIPTION: Places a yellow 89x27 rectangle at position (143, 59).
; PLAN: r0=143(x), r1=59(y), r2=89(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 59
LDI r2, 89
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
