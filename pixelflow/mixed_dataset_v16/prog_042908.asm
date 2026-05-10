; DESCRIPTION: Places a red 76x45 rectangle at position (64, 193).
; PLAN: r0=64(x), r1=193(y), r2=76(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 193
LDI r2, 76
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
