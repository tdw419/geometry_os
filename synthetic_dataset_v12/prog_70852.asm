; DESCRIPTION: Renders a white box of size 113x47 starting at (284, 174).
; PLAN: r0=284(x), r1=174(y), r2=113(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 174
LDI r2, 113
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
