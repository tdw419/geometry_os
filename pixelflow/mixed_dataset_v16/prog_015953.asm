; DESCRIPTION: Places a cyan 55x27 rectangle at position (224, 29).
; PLAN: r0=224(x), r1=29(y), r2=55(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 29
LDI r2, 55
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
