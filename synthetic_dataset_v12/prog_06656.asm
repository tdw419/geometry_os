; DESCRIPTION: Places a orange 51x28 rectangle at position (386, 126).
; PLAN: r0=386(x), r1=126(y), r2=51(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 126
LDI r2, 51
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
