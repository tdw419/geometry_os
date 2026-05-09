; DESCRIPTION: Places a white 55x39 rectangle at position (72, 146).
; PLAN: r0=72(x), r1=146(y), r2=55(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 146
LDI r2, 55
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
