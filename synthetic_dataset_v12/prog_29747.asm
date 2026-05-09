; DESCRIPTION: Places a white 27x65 rectangle at position (460, 174).
; PLAN: r0=460(x), r1=174(y), r2=27(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 174
LDI r2, 27
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
