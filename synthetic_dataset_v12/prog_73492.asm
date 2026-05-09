; DESCRIPTION: Places a cyan 119x11 rectangle at position (245, 173).
; PLAN: r0=245(x), r1=173(y), r2=119(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 173
LDI r2, 119
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
