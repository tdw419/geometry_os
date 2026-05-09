; DESCRIPTION: Places a cyan 28x32 rectangle at position (40, 214).
; PLAN: r0=40(x), r1=214(y), r2=28(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 214
LDI r2, 28
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
