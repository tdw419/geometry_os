; DESCRIPTION: Places a white 27x50 rectangle at position (108, 28).
; PLAN: r0=108(x), r1=28(y), r2=27(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 28
LDI r2, 27
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
