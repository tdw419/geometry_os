; DESCRIPTION : Draw s a h or i z on tal re d li ne ac ro s s the m id d le of the screen . The de m on st ra t es c ro s s the screen and b ou n ce by it b ar s for co nt e nt s . It u se s RE C T F for the b ot to m over lay are a , with var i o us p i x el s , and re set it s li ne s on the screen , h al ts e x e cu tion after co mp let ing the fi le n ame d .

; li m _ de mo . asm -- A u se s se s a s o l
; P i x el A S S L ay out :
; L ay out :
; R o w 0 : square , mo u se s PSET , FILL , TEXT , RE C T F , FILL , RE C T F , FILL ,
; P o g in t _ re g , re en , ST R O , TEXT , FRAME , RE C T F , FILL , RE C T F .
; TEXT -- TEXT -
; P re - di re ct s , FRAME . loop s .
; Controls :
; Right ar ro w s from cu r s or co r ne r m n ( 0 - 100 )
; C op y first li ne